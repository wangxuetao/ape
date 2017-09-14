package com.dayuanit.ape.authen.handler;

import java.util.Calendar;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.dayuanit.ape.constant.ErrorCodeConstant;
import com.dayuanit.ape.domain.WXAccountInfo;
import com.dayuanit.ape.exception.BusException;
import com.dayuanit.ape.util.ApiConnector;

/**
 * 网页登录
 * 
 * @author xuetaowang
 * 
 */
@Component("wxAuthenHandler")
public class WXAuthenWebHandler extends AuthenHandler {

	@Value("#{configProperties['appid']}")
	private String appid;

	@Value("#{configProperties['redirect_uri']}")
	private String redirectUri;

	@Value("#{configProperties['wx_code_url']}")
	private String wxCodeReqestUrl;

	@Value("#{configProperties['secret']}")
	private String secret;

	@Value("#{configProperties['wx_accoiunt_token_url']}")
	private String accountTokenUrl;

	@Value("#{configProperties['wx_user_info_url']}")
	private String userInfoUrl;

	private static final String RESPONSE_TYPE = "code";
	private static final String SCOPE = "snsapi_login";
	private static final String GRANT_TYPE = "authorization_code";

	public String createAuthenRequest() {
		StringBuilder sb = new StringBuilder();
		sb.append(wxCodeReqestUrl).append("?").append("appid=").append(appid)
				.append("&").append("redirect_uri=").append(redirectUri)
				.append("&").append("response_type=").append(RESPONSE_TYPE)
				.append("&").append("scope=").append(SCOPE);

		String codeUrl = sb.toString();

		logger.info("微信网页登录获取code请求URL={}", codeUrl);

		return codeUrl;
	}
	
	public WXAccountInfo processAuthen(String code) {
		
		// 获取accessToken
		WXAccessTokenInfo tokenInfo = getAccessToken(code);
		
		if (StringUtils.isBlank(tokenInfo.getAccess_token())) {
			throw new BusException("微信登录失败", ErrorCodeConstant.WX_GET_TOKEN);
		}
		
		// 获取用户信息
		WXUserInfo userInfo = getUserInfo(tokenInfo.getAccess_token(), tokenInfo.getOpenid());
		if (null == userInfo || StringUtils.isBlank(userInfo.getUnionid())) {
			throw new BusException("微信登录失败", ErrorCodeConstant.WX_GET_USER_INFO);
		}
				
		// 封装用户信息
		WXAccountInfo accountInfo = new WXAccountInfo();
		accountInfo.setAccessToken(tokenInfo.getAccess_token());
		accountInfo.setCity(userInfo.getCity());
		accountInfo.setCountry(userInfo.getCountry());
		accountInfo.setHeadImgUrl(userInfo.getHeadimgurl());
		accountInfo.setNickName(userInfo.getNickname());
		accountInfo.setOpenId(tokenInfo.getOpenid());
		accountInfo.setProvince(userInfo.getProvince());
		accountInfo.setRefreshToken(tokenInfo.getRefresh_token());
		accountInfo.setScope(tokenInfo.getScope());
		accountInfo.setSex(userInfo.getSex());
		accountInfo.setUnionId(userInfo.getUnionid());
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.SECOND, tokenInfo.getExpires_in());
		accountInfo.setExpiresDate(cal.getTime());
		
		return accountInfo;
	}

	private WXAccessTokenInfo getAccessToken(String code) {
		StringBuilder sb = new StringBuilder();
		sb.append(accountTokenUrl).append("?").append("appid=").append(appid)
				.append("&").append("secret=").append(secret).append("&")
				.append("code=").append(code).append("&").append("grant_type=")
				.append(GRANT_TYPE);

		String tokenUrl = sb.toString();

		logger.info("微信网页登录获取accountToken请求URL={}", tokenUrl);

		String msg = ApiConnector.get(tokenUrl, null);
		logger.info("微信网页登录accountToken请求返回信息={}", msg);

		WXAccessTokenInfo tokenInfo = JSON.parseObject(msg,
				WXAccessTokenInfo.class);
		
		return tokenInfo;
	}

	private WXUserInfo getUserInfo(String accessToken, String openid) {
		StringBuilder sb = new StringBuilder();
		sb.append(userInfoUrl).append("?").append("access_token=")
				.append(accessToken).append("&").append("openid=")
				.append("openid");

		String infoUrl = sb.toString();
		logger.info("微信网页登录获取userInfo请求URL={}", infoUrl);
		String msg = ApiConnector.get(infoUrl, null);
		logger.info("微信网页登录userInfo请求返回信息={}", msg);
		
		WXUserInfo userInfo = JSON.parseObject(msg, WXUserInfo.class);
		return userInfo;

	}

	public static class WXUserInfo {
		private String openid;
		private String nickname;
		private Integer sex;
		private String province;
		private String city;
		private String country;
		private String headimgurl;
		private String unionid;
		private List<String> privilege;
		private String errcode;
		private String errmsg;
		
		public String getErrcode() {
			return errcode;
		}

		public void setErrcode(String errcode) {
			this.errcode = errcode;
		}

		public String getErrmsg() {
			return errmsg;
		}

		public void setErrmsg(String errmsg) {
			this.errmsg = errmsg;
		}

		public String getOpenid() {
			return openid;
		}

		public void setOpenid(String openid) {
			this.openid = openid;
		}

		public String getNickname() {
			return nickname;
		}

		public void setNickname(String nickname) {
			this.nickname = nickname;
		}

		public Integer getSex() {
			return sex;
		}

		public void setSex(Integer sex) {
			this.sex = sex;
		}

		public String getProvince() {
			return province;
		}

		public void setProvince(String province) {
			this.province = province;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getCountry() {
			return country;
		}

		public void setCountry(String country) {
			this.country = country;
		}

		public String getHeadimgurl() {
			return headimgurl;
		}

		public void setHeadimgurl(String headimgurl) {
			this.headimgurl = headimgurl;
		}

		public String getUnionid() {
			return unionid;
		}

		public void setUnionid(String unionid) {
			this.unionid = unionid;
		}

		public List<String> getPrivilege() {
			return privilege;
		}

		public void setPrivilege(List<String> privilege) {
			this.privilege = privilege;
		}

	}

	public static class WXAccessTokenInfo {
		private String access_token;
		private Integer expires_in;
		private String refresh_token;
		private String openid;
		private String scope;
		private String errcode;
		private String errmsg;

		public String getErrcode() {
			return errcode;
		}

		public void setErrcode(String errcode) {
			this.errcode = errcode;
		}

		public String getErrmsg() {
			return errmsg;
		}

		public void setErrmsg(String errmsg) {
			this.errmsg = errmsg;
		}

		public String getAccess_token() {
			return access_token;
		}

		public void setAccess_token(String access_token) {
			this.access_token = access_token;
		}

		public Integer getExpires_in() {
			return expires_in;
		}

		public void setExpires_in(Integer expires_in) {
			this.expires_in = expires_in;
		}

		public String getRefresh_token() {
			return refresh_token;
		}

		public void setRefresh_token(String refresh_token) {
			this.refresh_token = refresh_token;
		}

		public String getOpenid() {
			return openid;
		}

		public void setOpenid(String openid) {
			this.openid = openid;
		}

		public String getScope() {
			return scope;
		}

		public void setScope(String scope) {
			this.scope = scope;
		}

	}

}

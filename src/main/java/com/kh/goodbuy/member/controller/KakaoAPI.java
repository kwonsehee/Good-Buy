package com.kh.goodbuy.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class KakaoAPI {

	public String getAccessToken(String code) {
		
		String accessToken = "";
		String refreshToken = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn= (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=5a7a733b7acbd667518c7886e00f1231");
			sb.append("&redirect_uri=http://localhost:8082/goodbuy/member/auth/kakao/callback");
			sb.append("&code="+code);
			
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode=  conn.getResponseCode();
			System.out.println("response code = "+responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line="";
			String result = "";
			
			while((line=br.readLine())!=null) {
				result+=line;
			}
			System.out.println("response body ="+result);
			JsonParser parser =new JsonParser();
			JsonElement element =parser.parse(result);
			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
			
			br.close();
			bw.close();
					
		}catch(Exception e) {
		e.printStackTrace();	
		}
		return accessToken;
	}

//	public HashMap<String, Object> getUserInfo(String accessToken) {
//		System.out.println("여기오니? getUserInfo");
//		HashMap<String, Object> userInfo = new HashMap<String, Object>();
//		String reqUrl = "https://kapi.com/v2/user/me";
//		try {
//			System.out.println("여기오니? getUserInfo22222");
//			URL url = new URL(reqUrl);
//			HttpURLConnection conn= (HttpURLConnection)url.openConnection();
//			conn.setRequestMethod("POST");
//			conn.setDoOutput(true);
//			conn.setRequestProperty("Authorization", "Bearer "+accessToken);
//			
//			int responseCode = conn.getResponseCode();
//			System.out.println("여기오니? getUserInfo333311111");
//			System.out.println("responseCode : "+responseCode);
//			
//			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			System.out.println("여기오니? getUserInfo3333");
//			String line="";
//			String result = "";
//			
//			while((line=br.readLine())!=null) {
//				result += line;
//				
//			}
//			
//			System.out.println("response body = "+result);
//			
//			
//			
//			JsonParser parser = new JsonParser();
//			JsonElement element = parser.parse(result);
//			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
//			JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
//			
//			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
//			String email = kakaoAccount.getAsJsonObject().get("email").getAsString();
//			
//			userInfo.put("nickname", nickname);
//			userInfo.put("email", email);
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return userInfo;
//	}

	public HashMap<String, Object> getUserInfo (String access_Token) {
	    
	    //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        String id = element.getAsJsonObject().get("id").getAsString();
	        System.out.println("id : "+id);
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
	        
	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);
	        userInfo.put("id", id);
	        
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    
	    return userInfo;
	}
	public void kakaoLogout(String accessToken) {
		String reqURL = "http://kapi.kakao.com/v1/user/logout";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer "+accessToken);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode = "+responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String result = "";
			String line="";
			
			while((line=br.readLine())!=null) {
				result +=line;
				
			}
			System.out.println(result);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		 
	}

}



















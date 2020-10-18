package com.nusang.action.asist;

import java.io.UnsupportedEncodingException;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.tomcat.util.json.JSONParser;
import org.json.simple.JSONObject;

import lombok.Data;

@Data
public class JHttpClient {

	private HttpClient client = null;
	private HttpPost postRequest = null;
	private JSONObject header = null;
	private JSONObject body = null;
	private JSONObject res = null;

	public JSONObject request(String url) {

		try {
			client = HttpClientBuilder.create().build(); // HttpClient 생성
			postRequest = new HttpPost(url); // POST 메소드 URL 새성

			headerCheck();
			bodyCheck();

			HttpResponse javaResponse = client.execute(postRequest);

			// Response 출력
			if (javaResponse.getStatusLine().getStatusCode() == 200) {
				ResponseHandler<String> handler = new BasicResponseHandler();
				javaResponse.setHeader("Content-Type", "application/json");
				javaResponse.setHeader("charset", "utf-8");
				System.out.println(javaResponse.getEntity());
				String body = handler.handleResponse(javaResponse);
				System.out.println("응답 성공 : " + body);
				for (int i = 0; i < javaResponse.getAllHeaders().length; i++) {
					System.out.println("header i  : " + javaResponse.getAllHeaders()[i].getName()
							+ javaResponse.getAllHeaders()[i].getValue());
				}

				JSONParser parser = new JSONParser(body);
				res = new JSONObject();
				res.putAll(parser.object());

			} else {
				System.out.println("response is error : " + javaResponse.getStatusLine());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	private void headerCheck() throws UnsupportedEncodingException {
		postRequest.setHeader("Content-Type", "application/json");
		postRequest.setHeader("charset","utf-8");
		if (header != null) {
			System.out.println("header :" + header.toJSONString());

			Object[] headArr = header.keySet().toArray();
			for (int i = 0; i < headArr.length; i++) {
				String key = headArr[i].toString();
				postRequest.setHeader(key, header.get(key).toString());
			}
		}
	}

	private void bodyCheck() throws UnsupportedEncodingException {

		if (body != null) {
			System.out.println("bodyStaerat~!~~!~");
			StringEntity sn = new StringEntity(body.toJSONString());
			System.out.println(body.toString());
			sn.setContentType("application/json");
			sn.setContentEncoding("utf-8");
			postRequest.setEntity(sn); // json 메시지 입력
			System.out.println("entity : " + postRequest.getEntity());
		}
	}
}

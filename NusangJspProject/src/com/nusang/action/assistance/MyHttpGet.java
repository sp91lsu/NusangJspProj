package com.nusang.action.assistance;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.tomcat.util.json.JSONParser;
import org.json.simple.JSONObject;

import lombok.Data;

@Data
public class MyHttpGet {

	private HttpClient client = null;
	private HttpGet getRequest = null;
	private JSONObject header = null;
	private JSONObject res = null;

	private EContentType cType = EContentType.FORM;

	public MyHttpGet(String url, EContentType cType) {
		client = HttpClientBuilder.create().build(); // HttpClient 생성
		getRequest = new HttpGet(url); // POST 메소드 URL 새성
		this.cType = cType;
	}

	public JSONObject request() {

		try {

			headerCheck();
			HttpResponse javaResponse = client.execute(getRequest);

			// Response 출력
			if (javaResponse.getStatusLine().getStatusCode() == 200) {
				ResponseHandler<String> handler = new BasicResponseHandler();
				javaResponse.setHeader("Content-Type", "application/json");
				System.out.println(javaResponse.getEntity());
				String body = handler.handleResponse(javaResponse);
				System.out.println("응답 성공 : " + body);
//				for (int i = 0; i < javaResponse.getAllHeaders().length; i++) {
//					System.out.println("header i  : " + javaResponse.getAllHeaders()[i].getName()
//							+ javaResponse.getAllHeaders()[i].getValue());
//				}

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

		getRequest.setHeader("Content-Type", cType.getText());
		if (header != null) {
			System.out.println("header :" + header.toJSONString());

			Object[] headArr = header.keySet().toArray();
			for (int i = 0; i < headArr.length; i++) {
				String key = headArr[i].toString();
				getRequest.setHeader(key, header.get(key).toString());
			}
		}
	}

}

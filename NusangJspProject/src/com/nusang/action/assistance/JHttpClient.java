package com.nusang.action.assistance;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
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

	private EContentType cType = EContentType.JSON;

	public JHttpClient(String url, EContentType cType) {
		client = HttpClientBuilder.create().build(); // HttpClient 생성
		postRequest = new HttpPost(url); // POST 메소드 URL 새성
		this.cType = cType;
	}

	public JSONObject request() {

		try {

			headerCheck();
			bodyCheck();

			HttpResponse javaResponse = client.execute(postRequest);

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

		postRequest.setHeader("Content-Type", cType.getText());
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

			if (cType == EContentType.JSON) {
				StringEntity sn = new StringEntity(body.toJSONString());
				System.out.println("body : " + body.toJSONString());
				System.out.println(body.toString());
				sn.setContentType(cType.getText());
				postRequest.setEntity(sn); // json 메시지 입력
				System.out.println("entity : " + postRequest.getEntity());
			} else if (cType == EContentType.FORM) {
				List<NameValuePair> pair = new ArrayList<NameValuePair>();
				Object[] bodyArr = body.keySet().toArray();
				for (int i = 0; i < bodyArr.length; i++) {
					String key = bodyArr[i].toString();
					pair.add(new BasicNameValuePair(key, body.get(key).toString()));
				}
				UrlEncodedFormEntity ent = new UrlEncodedFormEntity(pair, HTTP.UTF_8);
				postRequest.setEntity(ent);
			}
		}
	}
}

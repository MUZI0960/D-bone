package kr.or.ddit.kakaoapi.contorller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/kakao")
public class KakaoPayAPI {
	
	/*
	@RequestMapping("/pay")
	@ResponseBody
	public String kakaopay() {
		
		log.info("pay위치");
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");			// 카카오에서 제공하는 URL
			HttpURLConnection conn  = (HttpURLConnection) url.openConnection();		// 서버와 서버간의 연결. 클라이언트와 카카오
			conn.setRequestMethod("POST");		// 카카오에서 원하는대로 POST요청으로 보내기
			conn.setRequestProperty("Authorization", "KakaoAK ${3fb97369b8ee1174b7750985a8ccdc00}");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true);
			
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=진료비&quantity=1&total_amount=10000&tax_free_amount=0&approval_url=http://localhost/FinalPJ/kakao/success&fail_url=https://developers.kakao.com/fail&cancel_url=https://developers.kakao.com/cancel";
			
			OutputStream sender = conn.getOutputStream();
			DataOutputStream datasender = new DataOutputStream(sender);
			datasender.writeBytes(param);
			datasender.flush();
			datasender.close();
			
			int result = conn.getResponseCode();
			
			InputStream receive;
			if(result == 200) {
				receive = conn.getInputStream();
			} else {
				receive = conn.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(receive);
			BufferedReader bufferCast =	new BufferedReader(reader);	// 문자열로 형변환
			
			log.info("리턴값 {}", bufferCast.readLine());
			
			return bufferCast.readLine();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
	}
	
	
	@RequestMapping("success")
	@ResponseBody
	public String success() {
		return "성공";
	}
	 */
	@GetMapping("kakaopay")
	@ResponseBody
	public String kakaopay() {
		log.info("왔는지 확인");
		try {
			// 보내는 부분
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK 3fb97369b8ee1174b7750985a8ccdc00"); // 어드민 키
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
			String parameter = "cid=TC0ONETIME" // 가맹점 코드
					+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
					+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
					+ "&item_name=초코파이" // 상품명
					+ "&quantity=1" // 상품 수량
					+ "&total_amount=5000" // 총 금액
					+ "&vat_amount=200" // 부가세
					+ "&tax_free_amount=0" // 상품 비과세 금액
					+ "&approval_url=https://developers.kakao.com/success" // 결제 성공 시
					+ "&fail_url=http://localhost:80/" // 결제 실패 시
					+ "&cancel_url=http://localhost:80/"; // 결제 취소 시
			OutputStream send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
			DataOutputStream dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
			dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
			dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)
			
			int result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
			InputStream receive; // 받다
			
			if(result == 200) {
				receive = connection.getInputStream();
			}else {
				receive = connection.getErrorStream(); 
			}
			// 읽는 부분
			InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
			BufferedReader change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
			// 받는 부분
			return change.readLine(); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
}

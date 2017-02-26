package com.example.controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

	@RequestMapping(name = "/", method = RequestMethod.GET)
	public String root(ModelMap m) {
		return "hello";
	}
	
	
	@RequestMapping(name = "/findHotels", method = RequestMethod.POST)
	public String findCities(@RequestParam String hotelDestination, ModelMap m) {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("hotelDestination", "");
		params.put("travelStartDate", "");
		params.put("travelEndDate", "");
		params.put("", "");
		
		
		//String paramss = "{'hotelDestination': '" + hotelDestination + "' + 'travelStartDate': '" + travelStartDate + "' }";
		
		m.addAttribute("countries", callWebServiceCities("https://offersvc.expedia.com/offers/v2/getOffers?scenario=deal-finder&page=foo&uid=foo&productType=Hotel", params));
		return "hello";
	}

	private String callWebService(String wsUrl) {
		StringBuffer result = new StringBuffer();
		try {
			
			URL url = new URL(wsUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");

			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			String output;
			while ((output = br.readLine()) != null) {
				result.append(output);
			}

			conn.disconnect();

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();

		}
		
		return result.toString();
	}
	
	private String callWebServiceCities(String wsUrl, Map<String, String> params) {
		StringBuffer result = new StringBuffer();
		try {

			URL url = new URL(wsUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");

			OutputStream os = conn.getOutputStream();
			
			String country = params.get("country");
			os.write(country.getBytes());
			os.flush();

			if (conn.getResponseCode() != HttpURLConnection.HTTP_CREATED) {
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			String output;
			while ((output = br.readLine()) != null) {
				result.append(output);
			}

			conn.disconnect();

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result.toString();
	}

}
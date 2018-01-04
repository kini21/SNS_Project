package com.sns.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sns.repository.CommonDao;

@Service
public class PostService {

	@Autowired
	private CommonDao dao;
	
//	post list select.
	@Transactional
	public List<Map<String, Object>> postList() {
		return dao.selectList("post.selectList", null);
	}
	
//	post insert.
	@Transactional
	public int postInsert(Map map) {
		return dao.insert("post.insertItem", map);
	}
	
//	post file insert.
	@Transactional
	public int postFileInsert(MultipartHttpServletRequest req, String pid) {
		int rc = 0;
		
		try {
			List<Map<String, Object>> transList = new ArrayList<Map<String, Object>>();        // 파일의 정보를 저장하는 변수
			Iterator<String> itr = req.getFileNames();                                         // 파일의 개수를 저장하는 변수
			MultipartFile mpf = null;                                                          // 파일의 정보를 추출하는 변수
			int cnt = 0;	                                                                       // 파일키 생성
			String sGroupKey = dao.selectStr("post.selectGroupKey", null);	                  // 그룹키 생성
	        	String sPath = 	req.getSession().getServletContext().getRealPath("/common/post/"); // 파일 저장 경로
	        	
			while(itr.hasNext()) {
//				1. 파일키를 생성하고 파일의 정보를 추출한다.
				cnt++;
				mpf = req.getFile(itr.next());
				if(mpf.isEmpty()) continue;
	            
//				2. 파일관리 테이블에 데이터를 insert한다.
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("pid", pid);
				param.put("GROUP_KEY", sGroupKey);
				param.put("FILE_KEY", cnt);
				param.put("FILE_REALNAME", mpf.getOriginalFilename());
				param.put("FILE_NAME", Calendar.getInstance().getTimeInMillis());
				param.put("FILE_PATH", sPath);
				param.put("FILE_LENGTH", mpf.getBytes().length);
				param.put("FILE_TYPE", mpf.getContentType());
				param.put("USER_ID", "1");
				transList.add(param);
				rc = dao.insert("post.insertFile", param);
				
//				3. 지정된 위치가 존재하는지 확인하고 없으면 경로를 생성한다.
				File chkDir = new File(sPath);
				if(!chkDir.isDirectory()) {
					chkDir.mkdirs();
				}
	            
//				4. 지정된 위치에 파일을 복사한다.
				FileCopyUtils.copy(mpf.getBytes(), new FileOutputStream(sPath + param.get("FILE_NAME")));
				
			}
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return rc;
	}
}

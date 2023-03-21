package com;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileUtil {
	public static void saveImage(String root, String fileName, byte[] data) throws IOException {
		
		root += "/images"; // 루트 디렉토리 이후에 images 추가
		File f = new File(root);
		if (!f.exists()) f.mkdir(); // ./images 디렉토리가 없는 경우 생성
		
		f = new File(root + "/" + fileName);
		FileOutputStream out = new FileOutputStream(f);
		out.write(data);
		out.close();
	}
}

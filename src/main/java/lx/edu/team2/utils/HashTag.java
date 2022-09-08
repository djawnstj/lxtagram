package lx.edu.team2.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HashTag {
	
	public List<String> setLinkHashTag(String content) {
		List<String> list = new ArrayList<String>();
		List<String> hashList = new ArrayList<String>();
		String pattern = "(?:^|\\s|[\\p{Punct}&&[^/]])(#[\\p{L}0-9-_]+)";
		String strRet = content;

		try {
			Pattern compiledPattern = Pattern.compile(pattern, Pattern.CASE_INSENSITIVE);
			Matcher matcher = compiledPattern.matcher(content);
			while (matcher.find()) {
				list.add(matcher.group().trim());
			}
			Collections.sort(list);
			if (list.size() > 0) {
				for (int k = list.size() - 1; k >= 0; k--) {
					String hashContent = list.get(k);
					String tagContent = hashContent.replace("#", "");
					hashList.add(tagContent);
					strRet = strRet.replaceAll(list.get(k), "<a href=\"" + "search-tag.do?url=" + hashContent.replace("#", "") + "\">" + hashContent + "</a>");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		hashList.add(strRet);
		return hashList;
	}

}

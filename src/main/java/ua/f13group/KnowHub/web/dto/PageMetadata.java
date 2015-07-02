package ua.f13group.KnowHub.web.dto;

import ua.f13group.KnowHub.domain.QuestionSortConfig;

public class PageMetadata {
	public QuestionSortConfig[] questionSortingConfig = QuestionSortConfig.class.getEnumConstants();
}

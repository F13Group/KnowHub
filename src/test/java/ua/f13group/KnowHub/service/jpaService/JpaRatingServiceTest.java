package ua.f13group.KnowHub.service.jpaService;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.runners.MockitoJUnitRunner;

import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.Rating;
import ua.f13group.KnowHub.repository.RatingRepository;
import static org.mockito.Mockito.*;
import static org.junit.Assert.*;


@RunWith(MockitoJUnitRunner.class)
public class JpaRatingServiceTest {

	@Mock
	RatingRepository ratingRepositoryMock;

	@InjectMocks
	JpaRatingService jpaRatingServiceMock;
	
	Question questionNotLiked;
	Question questionLiked;
	
	Rating ratingNotLiked;
	Rating ratingLiked;

	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		
		questionNotLiked = new Question();
		questionNotLiked.setId((long) 10);		
		ratingNotLiked = new Rating();
		ratingNotLiked.setId((long) 1);
		ratingNotLiked.setUserId((long) 10);
		ratingNotLiked.setQuestion(questionNotLiked);
		
		questionLiked = new Question();
		questionLiked.setId((long) 20);		
		ratingLiked = new Rating();
		ratingLiked.setId((long) 2);
		ratingLiked.setUserId((long) 10);
		ratingLiked.setQuestion(questionLiked);

		when(ratingRepositoryMock.ifLiked((long) 1, (long) 1)).thenReturn(true);
		when(ratingRepositoryMock.ifLiked((long) 1, (long) 2)).thenReturn(false);
		when(ratingRepositoryMock.ifLiked(
				ratingNotLiked.getUserId(), ratingNotLiked.getQuestion().getId()))
				.thenReturn(false);
		when(ratingRepositoryMock.ifLiked(
				ratingLiked.getUserId(), ratingLiked.getQuestion().getId()))
				.thenReturn(true);

		when(ratingRepositoryMock.countLikesByQuestionId((long) 1)).thenReturn((long) 10);
		
		when(ratingRepositoryMock.save(ratingNotLiked)).thenReturn(ratingNotLiked.getId());
	}

	@Test
	public void testIfLiked() {

		long userId = 1;
		long questionId = 1;

		assertTrue(jpaRatingServiceMock.ifLiked(userId, questionId));

		verify(ratingRepositoryMock, times(1)).ifLiked(userId, questionId);
	}

	@Test
	public void testCountLikesByQuestionId() throws Exception {

		long questionId = 1;
		Long expectedCount = (long) 10;

		assertEquals(expectedCount,jpaRatingServiceMock.countLikesByQuestionId(questionId));
		verify(ratingRepositoryMock, times(1)).countLikesByQuestionId(questionId);
	}

	@Test
	public void testSaveNotLikedYet() throws Exception {

		Long expectedId = ratingNotLiked.getId(); 

		assertEquals(expectedId,jpaRatingServiceMock.save(ratingNotLiked));
		verify(ratingRepositoryMock, times(1)).save(ratingNotLiked);
	}

	@Test
	public void testSaveLikedAlready() throws Exception {

		Long expectedId = ratingLiked.getId(); 

		assertEquals(expectedId,jpaRatingServiceMock.save(ratingLiked));
		verify(ratingRepositoryMock, times(0)).save(ratingLiked);
	}
}
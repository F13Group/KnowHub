//package ua.f13group.KnowHub.service.jpaService;
//
//import org.junit.Ignore;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import ua.f13group.KnowHub.service.RatingService;
//
//import static org.junit.Assert.*;
//
///**
// * Created by dennis on 10/20/2015.
// */
//@ContextConfiguration(locations = {"classpath:spring/spring-config.xml"})
//@RunWith(SpringJUnit4ClassRunner.class)
//public class JpaRatingServiceTest {
//
//    @Autowired
//    RatingService ratingService;
//
//    @Test
//    @Ignore
//    public void testIfLiked() throws Exception {
//
//        Boolean liked = ratingService.ifLiked(3L,2L);
//        Boolean expectedLiked = true;
//        assertEquals(expectedLiked,liked);
//
//
//    }
//
//    @Test
//    @Ignore
//    public void testCountLikesByQuestionId() throws Exception {
//
//        Long count = ratingService.countLikesByQuestionId(1L);
//        Long expectedCount = 3L;
//        assertEquals(expectedCount,count);
//
//    }
//}
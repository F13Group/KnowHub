package ua.f13group.KnowHub.service.jpaService;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({
	JpaQuestionServiceTest.class,
	JpaRatingServiceTest.class
})
public class AllJpaServiceTests {

}

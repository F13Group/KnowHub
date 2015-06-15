package ua.f13group.KnowHub.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.epam.knowhub.controller.model.Greeting;


@RestController
public class RestUserController {
	@RequestMapping("/greeting")
    public Greeting greeting(@RequestParam(value="name", defaultValue="World") String name) {
		System.out.println("greeting");
        return new Greeting(10, "Ivan");
    }
}
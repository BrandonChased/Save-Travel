package brandon.travel.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import brandon.travel.models.Travel;
import brandon.travel.services.TravelService;

@Controller
public class TravelController {

    @Autowired
    TravelService travelService;

    // Read All
    @RequestMapping("/")
    public String index(@ModelAttribute("travel") Travel travel, Model model) {
        List<Travel> travels = travelService.allTravels();
        model.addAttribute("travels", travels);
        return "index.jsp";
    }

    // Read One
    @GetMapping("/travels/{id}")
    public String show(Model model, @PathVariable("id") Long id) {
        Travel travel = travelService.getOneTravel(id);
        model.addAttribute("travel", travel);
        return "show.jsp";
    }

    // Create Travel
    @PostMapping("/travels")
    public String newTravel(
            Model model,
            @Valid @ModelAttribute("travel") Travel travel,
            BindingResult result) {
        if (result.hasErrors()) {
            List<Travel> travels = travelService.allTravels();
            System.out.println(travels);
            model.addAttribute("travels", travels);
            return "index.jsp";
        } else {
            travelService.createTravel(travel);
            return ("redirect:/");
        }
    }

    // Edit Travel page
    @GetMapping("/travels/edit/{id}")
    public String editTravel(
            Model model,
            @Valid @ModelAttribute("travels") Travel travels,
            BindingResult result,
            @PathVariable("id") Long id) {
        Travel travel = travelService.getOneTravel(id);
        model.addAttribute("travel", travel);
        return "edit.jsp";
    }

    // Edit Travel Item
    @PutMapping("/edit/{id}")
    public String edit(
            @PathVariable("id") Long id, @ModelAttribute("travel") Travel travel, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            travelService.updateTravel(travel);
            return "redirect:/";
        }
    }

    // Delete Travel Item in database
    @DeleteMapping("/travels/{id}")
    public String destroy(@PathVariable("id") Long id) {
        Travel travel = travelService.getOneTravel(id);
        travelService.deleteBurger(travel);
        return "redirect:/";
    }
}

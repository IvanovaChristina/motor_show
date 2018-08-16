package com.auto.motor_show.controller;

import com.auto.motor_show.repository.CarRepository;
import com.auto.motor_show.repository.entity.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {

    @Autowired
    private CarRepository carRepository;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/auto")
    public String autoController(Map<String, Object> model) throws IOException {
        Iterable<Car> cars = carRepository.findAll();

        model.put("cars", cars);

        return "auto";

    }

    @GetMapping("/main")
    public String mainController(@RequestParam(required = false, defaultValue = "") String filter,
                                 Model model) {
        Iterable<Car> cars = carRepository.findAll();

        if (filter != null && !filter.isEmpty()) {
            cars = carRepository.findByBrand(filter);
        } else {
            cars = carRepository.findAll();
        }

        model.addAttribute("cars", cars);
        model.addAttribute("filter", filter);

        return "main";

    }

    @PostMapping("/main")
    public String add(@RequestParam String text_brand,
                      @RequestParam String text_model,
                      @RequestParam String text_color,
                      @RequestParam String text_equipment,
                      @RequestParam String text_options,
                      @RequestParam int text_price,
                      @RequestParam("file") MultipartFile file,
                      Map<String, Object> model) throws IOException {
        Car car = new Car(text_brand, text_model, text_color, text_equipment, text_options, text_price);

        if (file != null) {
            File upload = new File(uploadPath);

            if (!upload.exists()) {
                upload.mkdir();
            }

            String uuid = UUID.randomUUID().toString();
            String fileName = uuid + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + fileName));

            car.setFilename(fileName);
        }

        carRepository.save(car);

        Iterable<Car> cars = carRepository.findAll();

        model.put("cars", cars);

        return "main";
    }


}

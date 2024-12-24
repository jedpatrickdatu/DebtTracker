package com.jed.DebtTracker;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/debt")
public class DebtController {

    @GetMapping("/{debtId}")
    public String getDebt(String debtId) {
        return "Debt found";
    }

}

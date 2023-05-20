package com.gbj.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id")
    private Long userId;

    private Double amount;
    private String type;
    private LocalDateTime timestamp;

    public Transaction(Long userId, Double amount, String purchase, LocalDateTime now) {

    }

    public Transaction() {

    }

    // Constructors, Getters and Setters
}
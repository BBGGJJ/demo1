package com.gbj.controller;

import com.gbj.entity.Transaction;
import com.gbj.entity.Wallet;
import com.gbj.repository.TransactionRepository;
import com.gbj.repository.UserRepository;
import com.gbj.repository.WalletRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {
    private final UserRepository userRepository;
    private final WalletRepository walletRepository;
    private final TransactionRepository transactionRepository;

    public UserController(UserRepository userRepository, WalletRepository walletRepository, TransactionRepository transactionRepository) {
        this.userRepository = userRepository;
        this.walletRepository = walletRepository;
        this.transactionRepository = transactionRepository;
    }

    // 查询用户钱包余额
    @GetMapping("/{userId}/balance")
    public ResponseEntity<Double> getUserWalletBalance(@PathVariable Long userId) {
        Wallet wallet = walletRepository.findByUserId(userId);
        if (wallet == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(wallet.getBalance());
    }

    // 用户消费接口
    @PostMapping("/{userId}/consume")
    public ResponseEntity<String> consume(@PathVariable Long userId, @RequestBody Double amount) {
        Wallet wallet = walletRepository.findByUserId(userId);
        if (wallet == null) {
            return ResponseEntity.notFound().build();
        }
        if (wallet.getBalance() < amount) {
            return ResponseEntity.badRequest().body("Insufficient balance");
        }
        wallet.setBalance(wallet.getBalance() - amount);
        walletRepository.save(wallet);
        transactionRepository.save(new Transaction(userId, amount, "Purchase", LocalDateTime.now()));
        return ResponseEntity.ok("Successfully consumed");
    }

    // 用户退款接口
    @PostMapping("/{userId}/refund")
    public ResponseEntity<String> refund(@PathVariable Long userId, @RequestBody Double amount) {
        Wallet wallet = walletRepository.findByUserId(userId);
        if (wallet == null) {
            return ResponseEntity.notFound().build();
        }
        wallet.setBalance(wallet.getBalance() + amount);
        walletRepository.save(wallet);
        transactionRepository.save(new Transaction(userId, amount, "Refund", LocalDateTime.now()));
        return ResponseEntity.ok("Successfully refunded");
    }

    // 查询用户钱包金额变动明细接口
    @GetMapping("/{userId}/transactions")
    public ResponseEntity<List<Transaction>> getUserTransactions(@PathVariable Long userId) {
        List<Transaction> transactions = transactionRepository.findByUserId(userId);
        if (transactions.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(transactions);
    }
}
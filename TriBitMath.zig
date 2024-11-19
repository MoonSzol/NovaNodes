// NovaNodes License and Terms of Service v1.0
// Copyright (c) 2024 Jesus M Avila Valenzuela and Cosmo

const std = @import("std");

// Convert Decimal to Ternary
pub fn decimal_to_ternary(value: i32) []i8 {
    var result: [10]i8 = .{0} ** 10; // Max 10 digits for demonstration
    var index: usize = 0;
    var num = value;
    while (num != 0) : (num /= 3) {
        result[index] = @intCast(i8, num % 3);
        index += 1;
    }
    return result[0..index];
}

// Ternary Addition
pub fn ternary_add(a: []i8, b: []i8) []i8 {
    var result: [10]i8 = .{0} ** 10; // Max 10 digits for demonstration
    var carry: i8 = 0;
    var max_len = std.math.max(a.len, b.len);
    for (0..max_len) |i| {
        const sum = (if (i < a.len) a[i] else 0) +
                    (if (i < b.len) b[i] else 0) + carry;
        result[i] = sum % 3;
        carry = sum / 3;
    }
    return result[0..max_len];
}

pub fn main() void {
    const stdout = std.io.getStdOut().writer();

    // Convert Decimal to Ternary
    const decimal_value: i32 = 10;
    const ternary_value = decimal_to_ternary(decimal_value);
    stdout.print("Decimal {d} in Ternary: {any}\n", .{decimal_value, ternary_value}) catch unreachable;

    // Ternary Addition
    const t1: []i8 = .{1, 2, 0}; // Ternary 021 (Decimal 7)
    const t2: []i8 = .{1, 1, 1}; // Ternary 111 (Decimal 13)
    const sum = ternary_add(t1, t2);
    stdout.print("Ternary Addition: {any} + {any} = {any}\n", .{t1, t2, sum}) catch unreachable;
}
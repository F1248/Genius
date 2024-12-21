//
// Operators.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

prefix operator !?

infix operator ==?: ComparisonPrecedence
infix operator !=?: ComparisonPrecedence
infix operator &&?: LogicalConjunctionPrecedence
infix operator ||?: LogicalDisjunctionPrecedence

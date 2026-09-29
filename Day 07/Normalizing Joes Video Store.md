---
aliases: [Database Fundamentals - Day 07]
tags: [database-fundamentals, term1, normalization]
course: "[[Database Fundamentals]]"
---

# Database Fundamentals — Day 7: Joe's Video Store Walkthrough

**Today's focus:** apply the 0NF → 3NF method to a full scenario, view by view, before merging the views into one ERD.

## Roadmap
View 1 (Customer Rents Video) → normalize to 3NF → View 2 (Video Information) → normalize to 3NF → [[Merging Tables|merge]] → final ERD. Method: [[Database Fundamentals - Day 05 Normalization Cheat Sheet]].

## View 1 — Customer Rents Video
Read the business rules first, then find what repeats. Here the **videos on a transaction** repeat, so that's the repeating group.

| Step | Result |
|---|---|
| 0NF | `TransactionID, TransactionDate, CustomerID, Name, Phone, Address, (VideoID, CopyNumber, Title, ReturnDate, RentalCharge, HistoricalRentalCharge), SubTotal, GST, Total` |
| 1NF | Split the repeating group into its own table (with `TransactionID` as FK); split name and address into atomic parts |
| 2NF | `Title` and `RentalCharge` depend only on `VideoID`, so they move to a Video table |
| 3NF | `Customer` details move to their own table (customer depends on `CustomerID`, not the transaction) |

**3NF tables:** Transaction · Customer · Rental detail (`VideoID, CopyNumber, ReturnDate, HistoricalRentalCharge, TransactionID`) · Video (`VideoID, Title, RentalCharge`)

Why both `HistoricalRentalCharge` and `RentalCharge`: Joe wants the charge at the time of each rental *and* the current charge.

## View 2 — Video Information (in-class example)
Business rules: movie types (Horror, Comedy, Action, Romance, Science fiction), formats (VHS, VCD, DVD), ratings (Children → X-Rated), and copy number is unique within Video ID.

| Step | Result |
|---|---|
| 1NF | Video table + a copy table (`VideoID, CopyNumber, AvailableForRental`) |
| 2NF | No violation |
| 3NF | `MovieType(TypeID, TypeName)` and `Rating(RatingCode, RatingDescription)` split out; `FormatID` replaces `Format` |

## To Know
- Same table name + same PK → merge the attributes (both views have a Video table keyed on `VideoID`)

## Homework

## Reflection
*What was the most surprising insight today?*

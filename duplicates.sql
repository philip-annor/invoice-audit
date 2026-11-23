SELECT Time_Entry_ID, COUNT() AS times_billed

FROM invoice_line

GROUP BY Time_Entry_ID

HAVING COUNT() > 1;
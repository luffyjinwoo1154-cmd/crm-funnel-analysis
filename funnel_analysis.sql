-- CRM Lead Funnel & Conversion Analysis
-- Dataset: leads.csv (650 synthetic CRM leads modeled on a real lead lifecycle:
-- New -> Contacted -> Qualified -> Demo Scheduled -> Proposal Sent -> Converted/Lost)

-- 1. Conversion rate and revenue by lead source
SELECT
    source,
    COUNT(*)                                              AS total_leads,
    SUM(CASE WHEN stage = 'Converted' THEN 1 ELSE 0 END)  AS converted_leads,
    ROUND(100.0 * SUM(CASE WHEN stage = 'Converted' THEN 1 ELSE 0 END) / COUNT(*), 1) AS conversion_rate_pct,
    SUM(deal_value_inr)                                   AS revenue_inr
FROM leads
GROUP BY source
ORDER BY conversion_rate_pct DESC;

-- 2. Funnel drop-off by stage (where leads currently sit)
SELECT
    stage,
    COUNT(*) AS leads_in_stage,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM leads), 1) AS pct_of_total
FROM leads
GROUP BY stage
ORDER BY
    CASE stage
        WHEN 'New' THEN 1 WHEN 'Contacted' THEN 2 WHEN 'Qualified' THEN 3
        WHEN 'Demo Scheduled' THEN 4 WHEN 'Proposal Sent' THEN 5
        WHEN 'Converted' THEN 6 WHEN 'Lost' THEN 7 END;

-- 3. Rep-level performance
SELECT
    rep,
    COUNT(*)                                              AS leads_owned,
    SUM(CASE WHEN stage = 'Converted' THEN 1 ELSE 0 END)  AS deals_won,
    ROUND(100.0 * SUM(CASE WHEN stage = 'Converted' THEN 1 ELSE 0 END) / COUNT(*), 1) AS win_rate_pct,
    ROUND(AVG(CASE WHEN stage = 'Converted' THEN days_to_close END), 1) AS avg_days_to_close
FROM leads
GROUP BY rep
ORDER BY win_rate_pct DESC;

-- 4. Month-over-month lead volume and conversion trend
SELECT
    strftime('%Y-%m', created_date)                        AS month,
    COUNT(*)                                                AS leads_created,
    SUM(CASE WHEN stage = 'Converted' THEN 1 ELSE 0 END)   AS converted,
    ROUND(100.0 * SUM(CASE WHEN stage = 'Converted' THEN 1 ELSE 0 END) / COUNT(*), 1) AS conversion_rate_pct
FROM leads
GROUP BY month
ORDER BY month;

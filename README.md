# CRM Lead Funnel & Conversion Analysis

A SQL + Excel analysis of a CRM lead funnel, built to practice the kind of 
reporting I did professionally with LeadSquared and Zoho CRM (lead scoring, 
funnel drop-off, rep performance).

**Note:** The dataset (`leads.csv`) is synthetic — 650 CRM-style leads I 
generated to mirror a realistic funnel, not real company data.

## Tools used
- **SQL** (`funnel_analysis.sql`) — conversion rate by source, stage-wise 
  funnel drop-off, rep win-rates, and month-over-month trend
- **Excel** (`CRM_Funnel_Dashboard.xlsx`) — same analysis rebuilt with live 
  formulas (SUMIFS, COUNTIFS, AVERAGEIFS) and charts, so the dashboard 
  recalculates automatically if the underlying data changes

## Key findings
- **Referral leads convert far better than paid channels** — 59% conversion 
  rate vs. 11% for Paid Social, despite Paid Social generating more raw leads
- **Nearly a third of leads are lost before reaching the demo stage** — nudging 
  early-stage follow-up speed would likely lift overall conversion
- **Rep performance varies by ~10 points in win rate** — the top rep closes at 
  29% vs. 19% for the lowest, worth digging into what the top performer does 
  differently

## Files
- `leads.csv` — raw lead-level data
- `funnel_analysis.sql` — SQL queries used for the analysis
- `CRM_Funnel_Dashboard.xlsx` — formula-driven dashboard with charts

# Water Treatment Risk, Cost, and Environmental Impact Analysis

This project analyzes multiple decentralized water treatment systems to understand:
- **Public health risk** using DALY (Disability-Adjusted Life Years)
- **Treatment cost** per gallon
- **Environmental impact** across five sustainability metrics
- **System performance under UV disinfection doses**
- **Trade-offs** between cost, health safety, and environmental footprint

The analysis was done in a Jupyter Notebook using Python.

---

## 🔬 Treatment Systems Evaluated
The dataset includes five decentralized treatment systems:
- **ACH** – Aerobic Composting with Heat
- **AR** – Anaerobic Reactor
- **GWMBR** – Greywater Membrane Bioreactor
- **RWH** – Rainwater Harvesting
- **WWMBR** – Wastewater Membrane Bioreactor

Each system has different costs, risks, and environmental patterns.

---

## 📊 What This Notebook Does

### **1. Data Cleaning and Preparation**
- Converted the dataset from wide to long format.
- Standardized column names.
- Removed unrealistic or negative values.
- Prepared summaries for DALY, cost, and environmental metrics.

### **2. Risk Analysis (DALY)**
We visualised how much health risk each treatment system poses.  
Key outputs:
- Boxplots showing the distribution of DALY.
- Identification of the safest and least safe systems.

### **3. UV Dose vs DALY**
We compared DALY values at different UV disinfection doses:
- **0 mJ/cm²**
- **40 mJ/cm²**
- **80 mJ/cm²**

This helped identify how UV affects pathogen reduction.

### **4. Environmental Impact Radar Chart**
We analyzed five environmental impact categories:
- Energy demand  
- Fossil fuel depletion  
- Global warming potential (CO₂-eq)  
- Water consumption  
- Water scarcity  

All metrics were normalized and plotted on a radar chart.

### **5. Cost Comparison**
A bar chart shows average cost ($/gal) for each system.

### **6. Trade-Off Analysis**
A final combined scatter plot compares:
- **Cost**
- **Health risk**
- **Environmental score**

This helps identify the most balanced and sustainable treatment option.

---

## 🧠 Summary of Findings

- **ACH** has the **highest risk** and the highest environmental footprint.  
- **AR** has the **highest cost** per gallon.  
- **GWMBR, RWH, and WWMBR** perform very similarly and consistently show:
  - Low DALY (safer)
  - Low cost
  - Low environmental impact
- UV dose **does not significantly change DALY**, meaning treatment design matters more than disinfection intensity.
- The most balanced systems appear to be:
  - **GWMBR**
  - **RWH**
  - **WWMBR**

---

## 📁 Files in This Repository

- `water_treatment_analysis.ipynb` — main analysis notebook  
- `NEWR_clean.csv` — cleaned dataset  
- `NEWR_Results_LRTs.xlsx` — raw dataset  

---

## 🚀 How to Run the Notebook
1. Install required libraries:
   ```bash
   pip install pandas numpy matplotlib seaborn scikit-learn


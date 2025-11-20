
import os
import pandas as pd
import numpy as np

os.makedirs("input", exist_ok=True)

sample_metadata = pd.DataFrame({
    'sample_id': [f'Sample_{i}' for i in range(1,13)],
    'cell_type': np.random.choice(['HEK293', 'HeLa', 'U2OS', 'Primary'], size=12),
    'treatment': np.random.choice(['Control', 'Drug_A', 'Drug_B', 'Drug_C'], size=12),
    'replicate': np.random.choice([1,2,3], size=12),
    'concentration_uM': np.random.choice([0, 1, 10, 50, 100], size=12)
})

mass_spec_results = pd.DataFrame({
    'sample_id': np.random.choice(sample_metadata['sample_id'], size=10, replace=False),
    'total_proteins': np.random.randint(1000, 3000, size=10),
    'unique_peptides': np.random.randint(8000, 20000, size=10),
    'contamination_level': np.round(np.random.uniform(0.005, 0.08, size=10), 3)
})

quality_metrics = pd.DataFrame({
    'sample_id': np.random.choice(sample_metadata['sample_id'], size=9, replace=False),
    'rin_score': np.round(np.random.uniform(5.5, 9.8, size=9), 2),
    'pcr_duplication': np.round(np.random.uniform(0.05, 0.35, size=9), 3),
    'mapping_rate': np.round(np.random.uniform(0.75, 0.99, size=9), 3)
})

sample_metadata.to_csv("input/metadata.csv", index=False)
mass_spec_results.to_csv("input/ms_results.csv", index=False)
quality_metrics.to_csv("input/quality.csv", index=False)

print("Generated metadata.csv, ms_results.csv, quality.csv in input/")

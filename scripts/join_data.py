
import pandas as pd
import os

# Пути к файлам
metadata_path = os.path.join("input", "metadata.csv")
ms_path = os.path.join("input", "ms_results.csv")
quality_path = os.path.join("input", "quality.csv")

print("Чтение входных данных")

metadata = pd.read_csv(metadata_path)
ms = pd.read_csv(ms_path)
quality = pd.read_csv(quality_path)

print("Файлы загружены:")
print(f"- metadata: {metadata.shape}")
print(f"- mass_spec: {ms.shape}")
print(f"- quality: {quality.shape}")

# JOIN 1: INNER 
inner_join = metadata.merge(ms, on="sample_id", how="inner").merge(quality, on="sample_id", how="inner")
print(f"INNER JOIN: {inner_join.shape}")

# JOIN 2: LEFT 
left_join = metadata.merge(ms, on="sample_id", how="left").merge(quality, on="sample_id", how="left")
print(f"LEFT JOIN: {left_join.shape}")

# JOIN 3: RIGHT 
right_join = metadata.merge(ms, on="sample_id", how="right").merge(quality, on="sample_id", how="right")
print(f"RIGHT JOIN: {right_join.shape}")

# JOIN 4: OUTER 
outer_join = metadata.merge(ms, on="sample_id", how="outer").merge(quality, on="sample_id", how="outer")
print(f"OUTER JOIN: {outer_join.shape}")

# OUTPUT 
os.makedirs("output", exist_ok=True)
inner_join.to_csv("output/inner_join.csv", index=False)
left_join.to_csv("output/left_join.csv", index=False)
right_join.to_csv("output/right_join.csv", index=False)
outer_join.to_csv("output/outer_join.csv", index=False)

print("Джоины завершены и сохранены в папку output/")

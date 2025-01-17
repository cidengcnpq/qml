# <p align="center">Early investigations on Unsupervised Quantum Machine Learning for Structural Health Monitoring


#### Victor Higino Meneguitte Alves[^1], M.Sc. in Civil Engineering
-	Graduate Program in Civil Engineering, Faculty of Engineering, University of Juiz de Fora, Juiz de Fora, Minas Gerais, Brazil

#### Raphael Fortes Infante Gomes[^2], Assistant Professor 
-	Faculty of Physical Engineering, University of Latin American Integration, Foz do Iguaçu, Paraná, Brazil

#### Alexandre Abrahão Cury[^3], Associate Professor
-	Graduate Program in Civil Engineering, Faculty of Engineering, University of Juiz de Fora, Juiz de Fora, Minas Gerais, Brazil

[^1]: Orcid: [0000-0001-8959-050X](https://orcid.org/0000-0001-8959-050X)
[^2]: Orcid: [0000-0002-7199-6533](https://orcid.org/0000-0002-7199-6533)
[^3]: Orcid: [0000-0002-8860-1286](https://orcid.org/0000-0002-8860-1286)
  
## Abstract
<p align="justify">This study presents a novel approach using unsupervised Quantum Machine Learning (QML) for Structural Health Monitoring (SHM). The proposed methodology involves extracting features from raw acceleration signals and encoding them into quantum states for a subsequent analysis in a quantum classifier. By training the model with known intact scenarios, an anomaly score function is evaluated to identify deviations from normal behavior aiming to detect potential structural anomalies. The framework is validated through experimental applications on a two-story laboratory frame and on a real-scale railway bridge, demonstrating encouraging results in anomaly detection, localization, and quantification. Through experimentation and numerical analyses, this study advances on the edge of SHM research, laying the foundation for future exploration at the intersection of Quantum Computing and Civil Engineering.
  
#### <p align="justify">Keywords: `Damage detection`, `Quantum computing`, `Structural Health Monitoring`, `Quantum Machine Learning` and `Unsupervised learning`.

  ### **<p align="center">Graphical abstract: Overview of the methodology steps**
![Fluxograma NÃO vetorizado](https://github.com/cidengcnpq/qml/assets/147100243/dff217ad-cab6-4cc2-9e54-63a5060dfa3c)
 ### Highlights
- [x] Real scale structure application
- [X] Quantum ML algorithm
- [X] Unsupervised
- [X] Damage detection (Rytter scale I[^4])
- [X] Damage localization (Rytter scale II[^4])
- [X] Damage quantification (Rytter scale III[^4])
> [!NOTE]
> <p align="justify">As quantum hardware technology continues to advance and become more accessible, the potential for QML algorithms to evolve in complexity and capability grows. This progression may lead to QML models outperforming classic ML ones in various applications. In the authors’ perspective, despite being relatively new beyond the quantum computing academia, the preliminary investigations of QML in real-world applications, as this paper’s example, offers the SHM industry significant insights into how it can be utilized and opens the way for further study directions in the topic.

###  **● The data of laboratory frame are on files:**
`Laboratory frame - d0 - Intact data`, `Laboratory frame - d0_2 - Unseen intact data`, `Laboratory frame - d1 - Damage scenario 1` and `Laboratory frame - d2 - Damage scenario 2`.

###  **● The data of KW51 bridge are on files:** 
`March - 4am`, `April - 4am`, `July - 4am` and `October - 4am`.

###  **● The *feature extraction* related functions are on files:** 
  `Feature_generator_function.m`, `generate_statistics_features_KW51_bridge.m` and `generate_statistics_features_laboratory_frame.m`.

###  **● Pre-extracted features (statistics) are on directories:** 
  `Features - Statistics - KW51 bridge` and `Features - Statistics - Laboratory Frame`.

###  **● The *QML* model computations related functions (in python) are on files:** 
`Jupyter codes` contain Jupyter notebook codes in subfolders for each experimental application. 
`Links for QML model training code and result.xlsx` is a spreadsheet containing the summary results and the Google Colaboratory links of each simulation.

> [!TIP]
> <p align="justify">You can run Jupyter QML notebooks on Google Colab using cloud CPUs. To try it yourself, simply upload the pre-extracted features. You can view partial training and testing results without needing to re-run the code. Check the `Jupyter codes` folder or run the notebook directly on Colab.

###   **● The *k-means* and *hierarchical clustering* computations related functions (in matlab) are on files:** 
`acc_kmeans_KW51.m`, `acc_kmeans_laboratory_frame.m`, `hierarchical_clustering_KW51.m` and `hierarchical_clustering_laboratory_frame.m`.

###   **● The *Comparison of QML and k-means* functions are on files:** 
`acc_comparison_KW51.m` and `acc_comparison_laboratory_frame.m`.

[^4]: [A. Rytter, Vibrational based inspection of civil engineering structures. Dept. of Building Technology and Structural Engineering, Aalborg University, Fracture and Dynamics. R9314 (44) (1993).](https://vbn.aau.dk/en/publications/vibrational-based-inspection-of-civil-engineering-structures)

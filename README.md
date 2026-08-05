# Genome-Assembly

## Conda Environments

```
conda env create -n seqkit -f seqkit.yml

conda env create -n ragtag -f ragtag.yml

conda env create -n hapbridge -f hapbridge.yml
```

## Workflow

### Assembly & Quality Assessment

1. Assess metrics of input files: seqkit1.sh

2. Run hifiasm for each of three samples: hifiasm_E1.sh, hifiasm_E2.sh, hifiasm_G1.sh

3. Extract sequences: extract_seqs.sh

4. Assess metrics of output contigs: seqkit2.sh, quast.sh

### Methylation-based phasing improvement

```
git clone https://github.com/Humonex/HapBridge.git
```

5. Convert bam files and map reads to assembly: minimap_E1.sh, minimap_E2.sh, minimap_G1.sh

6. Index: index.sh

7. Call variants: clair3.sh

8. Phase variants + index: phase.sh

9. Index: index2.sh

10. Create haplotagged bam: haplotag.sh

11. Remove secondary and supplementary alignments: primary.sh

12. Index: index3.sh

13. Improve variant phasing: hapbridge.sh

14. Use variants to phase assembly: phaseassembly.sh

### Scaffolding

15. Scaffold to reference genome: scaffold.sh

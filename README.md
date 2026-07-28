# Genome-Assembly

## Conda Environments

### Core Workflow

```
conda env create -n seqkit -f seqkit.yml

conda env create -n ragtag -f ragtag.yml
```

### HapBridge

```
conda env create -n hapbridge -f hapbridge.yml
```

## Workflow

### Assembly & Quality Assessment

1. Assess metrics of input files: seqkit1.sh

2. Run hifiasm for each of three samples: hifiasm_E1.sh, hifiasm_E2.sh, hifiasm_G1.sh

3. Extract sequences: extract_seqs.sh

4. Assess metrics of output contigs: seqkit2.sh, quast.sh

### Methylation-based variant phasing with HapBridge

```
git clone https://github.com/Humonex/HapBridge.git
cd HapBridge
```

5. Map reads to assembly: minimap_E1.sh, minimap_E2.sh, minimap_G1.sh

This step converts the original bam files with methylation tags to fastq, with tags retained in headers, then maps to the assembly and sorts the output.

6. Index: index.sh

7. Call variants: clair3.sh

8. Phase variants: phase.sh

9. Create haplotagged bam: haplotag.sh

10. Improve variant phasing: hapbridge.sh

### Phasing and Scaffolding

11. Use variants to phase assembly: phaseassembly.sh

12. Scaffold to reference genome: scaffold.sh

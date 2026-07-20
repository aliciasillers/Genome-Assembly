# Genome-Assembly

##Conda Environments

```
conda env create -n seqkit -f seqkit.yml

conda env create -n ragtag -f ragtag.yml
```

##Workflow

1. Assess metrics of input files: seqkit1.sh

2. Run hifiasm for each of three samples: hifiasm_E1.sh, hifiasm_E2.sh, hifiasm_G1.sh

3. Extract sequences: extract_seqs.sh

4. Assess metrics of output contigs: seqkit2.sh, quast.sh

5. Scaffold: scaffold.sh

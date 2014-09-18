# Sample SNP counts for BRCA1.
SELECT
  COUNT(sample_id) AS variant_count,
  sample_id
FROM (
  SELECT
    contig_name,
    start_pos,
    reference_bases,
    call.callset_name AS sample_id
  FROM
    [google.com:biggene:1000genomes.phase1_variants]
  WHERE
    contig_name = '17'
    AND start_pos BETWEEN 41196312
    AND 41277500
    AND vt ='SNP'
    AND (0 < call.first_allele
      OR 0 < call.second_allele)
    )
GROUP BY
  sample_id
ORDER BY
  sample_id

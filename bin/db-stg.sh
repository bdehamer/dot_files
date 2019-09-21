ssh -v -i ~/.awsam/accts/aostaging/keys/portal-dev-keypair/key.pem \
  -L 3307:portal-aostaging-mysql57.ctzjgf7pt3wt.us-east-2.rds.amazonaws.com:3306 \
  -L 3308:tagged-billing-aurora-aostaging.cluster-ctzjgf7pt3wt.us-east-2.rds.amazonaws.com:3306 \
  -L 3309:aostaging-hosttrackerdb-c1-i1.ctzjgf7pt3wt.us-east-2.rds.amazonaws.com:3306 \
  -N \
  ubuntu@172.26.204.7

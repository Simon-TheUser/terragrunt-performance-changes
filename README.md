# Terragrunt 0.50.15 became much slower with multiple dependencies

I use Terragrunt to spin up complete environments for quick testing and I  use the `dependencies` block a lot.  After upgrading Terragrunt to v0.50.15, I noticed that my `run-all` commands became very slow.

I've built a mock setup that ressembles my IaC development environment to more or less replicate the problem I saw.

## Note

1. The issue seems to be around building the dependencies, not reading the terraform outputs.
 

## Reproducing the issue

To reproduce the issue, simply run `terragrunt graph-dependencies` in the `iac` folder of this repo and look at the time it takes for terragrunt to return.


## Scripts to test Terragrunt speed

I put together three scripts that allows you to compare different the performance of different versions of Terragrunt. I used containers to keep things simple. Simply run the three scripts in the following order:

### 01-build_containers.sh
This script will build one container for each version of Terragrunt specified in the versions.sh file.

### 02-run_tests.sh
This script executes the same command against each version of terragrunt and records the time it takes to execute.

### 03-print-results.sh
This script simply prints the time it took for each container to execute.

### 04-delete_containers.sh
Cleans up and delete all the containers step 01 created.

## Example of my results
Here are the results of my performance tests against different versions of terragrunt on this git repository. Notice how version 0.50.15 became much slower to execute `graph-dependencies``:

```
Testing with Terragrunt version 0.43.3
Command exited with non-zero status 1
real    0m 2.61s
user    0m 3.24s
sys     0m 0.47s

Testing with Terragrunt version 0.50.10
Command exited with non-zero status 1
real    0m 2.31s
user    0m 2.83s
sys     0m 0.33s

Testing with Terragrunt version 0.50.15
Command exited with non-zero status 1
real    0m 53.45s
user    1m 8.33s
sys     0m 6.67s

Testing with Terragrunt version 0.50.16
Command exited with non-zero status 1
real    0m 52.77s
user    1m 6.94s
sys     0m 6.94s

Testing with Terragrunt version 0.50.17
Command exited with non-zero status 1
real    0m 52.10s
user    1m 6.73s
sys     0m 6.53s

Testing with Terragrunt version 0.51.7
Command exited with non-zero status 1
real    0m 51.16s
user    1m 5.29s
sys     0m 7.39s
```
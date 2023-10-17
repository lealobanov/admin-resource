// Pass the repo name
const recipe = "admin-resource";

//Generate paths of each code file to render
const contractPath = `${recipe}/cadence/contract.cdc`;
const transactionPath = `${recipe}/cadence/transaction.cdc`;

//Generate paths of each explanation file to render
const smartContractExplanationPath = `${recipe}/explanations/contract.txt`;
const transactionExplanationPath = `${recipe}/explanations/transaction.txt`;

export const adminResource= {
  slug: recipe,
  title: "Admin Resource",
  createdAt: new Date(2022, 3, 1),
  author: "Flow Blockchain",
  playgroundLink:
  "https://play.onflow.org/a7d190b6-e0f1-4acc-b34c-f37b39fbab33?type=tx&id=c252ea40-397c-43b0-acfb-c504a7268175&storage=none",
  excerpt:
    "Using an admin resource to have exclusive access to functions in a smart contract.",
  smartContractCode: contractPath,
  smartContractExplanation: smartContractExplanationPath,
  transactionCode: transactionPath,
  transactionExplanation: transactionExplanationPath,
};


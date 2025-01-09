import "ExampleNFT"

access(all) contract Recipe {
     // Declare an Admin resource for managing NFTs
    access(all) resource Admin {
        // Mint a new NFT
        access(all) fun mintNFT(): @ExampleNFT.NFT {
            return <-ExampleNFT.mintNFT()
        }

        // Create a new Admin resource
        access(all) fun createNewAdmin(): @Admin {
            return <-create Admin()
        }
    }

    // Function to create an Admin resource
    access(all) fun createAdmin(): @Admin {
        return <-create Admin()
    }
}
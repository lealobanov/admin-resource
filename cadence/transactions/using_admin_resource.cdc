import "NonFungibleToken"
import "ExampleNFT"

transaction {

    prepare(signer: auth(Storage) &Account) {
        // Check if the Admin resource already exists
        if signer.storage.borrow<&ExampleNFT.Admin>(from: /storage/nftAdminResource) != nil {
            log("Admin resource already exists in the account.")
            return
        }

        // Create a new Admin resource
        let adminResource <- ExampleNFT.createAdmin()

        // Save the Admin resource to the account's storage
        signer.storage.save(<-adminResource, to: /storage/nftAdminResource)

        log("Admin resource added to the account.")

        // Borrow the Admin resource back from storage
        let adminResourceRef = signer.storage.borrow<&ExampleNFT.Admin>(from: /storage/nftAdminResource)
            ?? panic("Failed to borrow the Admin resource after saving it to storage.")

        // Use the Admin resource to mint a new NFT
        let newNFT <- adminResourceRef.mintNFT()

        // Borrow the account's NFT collection to store the newly minted NFT
        let collection = signer.storage.borrow<&ExampleNFT.Collection>(from: ExampleNFT.CollectionStoragePath)
            ?? panic("NFT collection not found in the account. Please ensure the collection is set up.")

        // Deposit the newly minted NFT into the collection
        collection.deposit(token: <-newNFT)

        log("New NFT minted and added to the account's collection.")
    }

    execute {
        log("Transaction complete.")
    }
}

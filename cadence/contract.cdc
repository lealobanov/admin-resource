// Above is more code from the SetAndSeries Contract...
access(all) resource Admin {

    access(all) fun addSeries(seriesId: UInt32, metadata: {String: String}) {
        pre {
            SetAndSeries.series[seriesId] == nil:
                "Cannot add Series: The Series already exists"
        }

        // Create the new Series
        let newSeries <- create Series(
            seriesId: seriesId,
            metadata: metadata
        )

        // Add the new Series resource to the Series dictionary in the contract
        SetAndSeries.series[seriesId] <-! newSeries
    }

    access(all) fun borrowSeries(seriesId: UInt32): &Series {
        pre {
            SetAndSeries.series[seriesId] != nil:
                "Cannot borrow Series: The Series does not exist"
        }

        // Get a reference to the Series and return it
        return &SetAndSeries.series[seriesId] as &Series
    }

    access(all) fun createNewAdmin(): @Admin {
        return <-create Admin()
    }
}

...

// Code used in init() at the end of the contract

// Save Admin resource in storage
self.account.storage.save(<-create Admin(), to: self.AdminStoragePath)

// Publish a capability for the Admin resource
let adminCapability = self.account.capabilities.storage.issue<&SetAndSeries.Admin>(
    from: self.AdminStoragePath
)
self.account.capabilities.publish(adminCapability, at: self.AdminPrivatePath)
    ?? panic("Could not get a capability to the admin")

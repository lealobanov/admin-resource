import Test

access(all)
fun setup() {
    let err = Test.deployContract(
        name: "Recipe",
        path: "../contracts/Recipe.cdc",
        arguments: [],
    )

    Test.expect(err, Test.beNil())
}


access(all) fun testExample() {
    let array = [1, 2, 3]
    Test.expect(array.length, Test.equal(3))
}

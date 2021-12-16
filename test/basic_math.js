var basicMath = artifacts.require("BasicMath");

contract('basicMath', async accounts => {
    it("the sum should not overflow", async () => {
        try {
            const addResult = contractInstance.add(2**256-1, 5);
            assert.ok(false, "Threw an exception instead of overflowing.");
        } catch(error) {
            assert.ok(true, "Caught the exception");
        }
    })
});
<!-- Main App Svelte Component -->
<script>
  // State variables
  let isWarningSelected = true;
  let isWalletBlockSelected = false;
  let amountSpent = 0; // Initial value for the amount spent
  let updateMessage = ''; // Variable to store the update message

  //Toggle selected options
  function toggleWarning() {
    isWarningSelected = true;
    isWalletBlockSelected = false;
  }

  function toggleWalletBlock() {
    isWarningSelected = false;
    isWalletBlockSelected = true;
  }

  function handleAmountChange(event) {
    amountSpent = parseFloat(event.target.value); // Update the amountSpent variable with the user input
  }

  function exportToPython() {
    // You can perform any additional logic here to export the 'amountSpent' to a Python script
    // For demonstration purposes, we will just show the "Update sent" message on the website.
    updateMessage = '(Update sent to Deep Learning model)';
  }
</script>
<div class="container">
  <div class="unicorn">Unicorn</div>
  <div class="description-container">
    <div class="description">
      Unicorn is a Deep Learning-powered spending limiter that identifies historic losses and prevents you from repeating them. Centered on the idea that predicting emotions is easier than foreseeing complex markets, Unicorn can be set to either warn you or block your wallet when you reach a point of potential repeat loss.
    </div>
  </div>
  <div class="box-switch">
    <!-- Existing box-switch section -->
    <div class="switch-label label-left-margin">Warning</div>
    <div class="switch-box warning" class:selected={isWarningSelected} on:click={toggleWarning}>
      <!-- You can add an icon or any other visual indication inside this box if you want -->
    </div>
    <div
      class="switch-box block"
      class:selected={isWalletBlockSelected}
      on:click={toggleWalletBlock}
    >
      <!-- You can add an icon or any other visual indication inside this box if you want -->
    </div>
    <div class="switch-label label-right-margin">Wallet Block</div>
  </div>

  <!-- New component for Amount Spent input -->
  <div class="input-container">
    <div class="amount-input-container">
      <label for="amount">Total Spent:</label>
      <input type="number" id="amount" bind:value={amountSpent} on:change={handleAmountChange} />
    </div>

    <button class="export-button" on:click={exportToPython}>Update</button>
  </div>

{#if updateMessage}
<div class="update-message">{updateMessage}</div>
{/if}
</div>

<style>
  /* Basic styling */
  .container {
    max-width: 600px;
    margin: 0 auto;
    padding: 2rem;
    text-align: center;
  }

  .unicorn {
    font-size: 3.4rem;
    font-weight: bold;
    margin-bottom: 1rem;
    margin-top: 0rem;
    /* Use a gradient background for each letter */
    background: linear-gradient(135deg, #ff4081, #ff8a65, #f9d423, #66bb6a, #18ffff, #aa00ff);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
    margin-right: 3rem;
  }

  .update-message {
    font-size: 1rem;
    margin-top: .5rem;
    margin-right: 3.8rem;
    color: #444;
  }

  .description {
    font-size: 1.2rem;
    margin-bottom: 0rem; /* Adjust the spacing between the text and the container's bottom line */
    line-height: 1.6;
    color: #444;
  }

  .description-container {
    padding: 1rem; /* Add some padding to create space between the text and the perimeter */
    border: 1px solid #ccc; /* Thin grey perimeter */
    border-radius: 5px; /* Rounded corners for the perimeter */
    margin-bottom: 0.5rem; /* Decrease the vertical space between the description and the box-switch section */
    margin-top: 1rem; /* Bring the description container up slightly */
  }

  /* Box switch styling */
  .box-switch {
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #eee;
    border-radius: 25px;
    padding: 0.5rem;
    margin-top: 1.6rem; /* Increase vertical space between the description and the box-switch section */
    margin-bottom: .5rem;
  }

  .export-button {
    margin-right: 5rem;
  }

  .label-left-margin {
    margin-right: 0.5rem;
  }

  .label-right-margin {
    margin-left: 3.5rem; /* Adjust the margin as needed to move it to the desired position */
  }

  .input-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-top: .5rem;
  }

  .switch-label {
    font-size: 1rem;
    text-transform: uppercase;
    color: #555;
    font-weight: bold;
  }

  .switch-box {
    width: 50px;
    height: 30px;
    background-color: #fff;
    border-radius: 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: all 0.3s ease;
  }

  .switch-box.warning {
    transform: translateX(0);
    background-color: #000; /* Warning color */
  }

  .switch-box.block {
    transform: translateX(100%);
    background-color: #000; /* Wallet block color */
  }

  .switch-box.warning.selected {
    background-color: #66bb6a; /* Green when selected */
  }

  .switch-box.block.selected {
    background-color: #66bb6a; /* Black when selected */
  }

  /* Styles for the Amount Spent Input component */
  .amount-input-container {
    display: flex;
    align-items: center;
    margin-top: 1rem;
  }

  .amount-input-container label {
    font-size: 1.2rem;
    color: #555;
    margin-right: 1rem;
  }

  .amount-input-container input {
    padding: 0.5rem 1rem;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1.2rem;
  }

  button {
    margin-top: 1rem;
    padding: 0.5rem 1rem;
    background-color: #18ffff;
    border: none;
    border-radius: 5px;
    font-size: 1rem;
    cursor: pointer;
  }

  button:hover {
    background-color: #00e5ff;
  }
</style>

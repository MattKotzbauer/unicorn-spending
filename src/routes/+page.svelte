<!-- Unicorn.svelte -->

<script>
    // You can add any necessary logic here, but for simplicity, we'll skip it in this example.
  </script>
  
  <style>
    /* Basic styling */
    .container {
      max-width: 600px;
      margin: 0 auto;
      padding: 2rem;
      text-align: center;
    }
  
    .unicorn {
      font-size: 3rem;
      font-weight: bold;
      margin-bottom: 1rem;
      /* Use a gradient background for each letter */
      background: linear-gradient(135deg, #ff4081, #ff8a65, #f9d423, #66bb6a, #18ffff, #aa00ff);
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
    }
  
    .description {
      font-size: 1.2rem;
      margin-bottom: 2rem;
      line-height: 1.6;
      color: #444;
    }
  
    /* Box switch styling */
    .box-switch {
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #eee;
      border-radius: 25px;
      padding: 0.5rem;
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
      background-color: #ff9800; /* Warning color */
    }
  
    .switch-box.block {
      transform: translateX(100%);
      background-color: #e91e63; /* Wallet block color */
    }
  </style>
  
  <div class="container">
    <div class="unicorn">Unicorn</div>
    <div class="description">
      Unicorn is a Deep Learning-powered spending limiter that identifies historic losses and prevents you from repeating
      them. Centered on the idea that predicting emotions is easier than foreseeing complex markets, Unicorn can be set to
      either warn you or block your wallet when you reach a point of historic losses.
    </div>
    <div class="box-switch">
      <div class="switch-label">Warning</div>
      <div class="switch-box warning"> <!-- Add the "warning" class to move the square to the left -->
        <!-- You can add an icon or any other visual indication inside this box if you want -->
      </div>
      <div class="switch-box block"> <!-- Add the "block" class to move the square to the right -->
        <!-- You can add an icon or any other visual indication inside this box if you want -->
      </div>
      <div class="switch-label">Wallet Block</div>
    </div>
  </div>
  
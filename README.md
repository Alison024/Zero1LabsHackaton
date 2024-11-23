# **NFT Anon Battles**

![Project Status](https://img.shields.io/badge/status-in%20development-yellow)
![License](https://img.shields.io/badge/license-MIT-green)

---

## **Table of Contents**

1. [Motivation](#motivation)
2. [Introduction](#introduction)
3. [Game Overview](#game-overview)
4. [Utility and Workflow](#utility-and-workflow)
5. [Security](#security)
6. [Roadmap](#roadmap)
7. [Features](#features)
8. [How to Contribute](#how-to-contribute)
9. [License](#license)

---

## **Motivation**

Traditional web3 games often suffer from one of two key issues:

1. **Transparency:** Hackers can exploit public blockchain data to manipulate outcomes and gain an unfair advantage.
2. **Centralization:** Centralized game ownership introduces risks like arbitrary shutdowns, unfair changes, or becoming unplayable if the owner abandons the game.

By leveraging the encryption capabilities of the **fhEVM** and its built-in random number generation, **NFT Anon Battles** overcomes these challenges, providing a secure and decentralized solution for web3 gaming.

---

## **Introduction**

**NFT Anon Battles** is a collectible autobattler game inspired by popular titles like _Hearthstone_ and _Team Fight Tactics_. The primary goal is to maximize randomness while ensuring the game's integrity by preventing exploits through encryption.

The game utilizes **fhEVM** encryption features to restrict NFT stats visibility to the NFT owner and key smart contracts, safeguarding against hacks and preserving game balance.

---

## **Game Overview**

### **Game Mechanics**

- Players build a team of **three unique characters** (NFTs) with different stats and abilities:
  - **Attack**
  - **Health**
  - **Ability**
- Two teams face off, and the winner is determined by strategic team composition and stat synergy.

### **Winning the Game**

Players aim to combine their characters' abilities and stats to optimize performance. The winner is calculated based on:

1. Unique abilities
2. Health
3. Attack values

### **Gameplay Flow**

- Assemble a team from your NFT collection.
- Match up against another player using the matchmaking system.
- Compete in a fully decentralized battle, with the winner claiming **Battle Token (BT)** rewards.

---

## **Utility and Workflow**

**NFT Anon Battles** revolves around its native ERC20 token, **Battle Token (BT)**. Here's how it works:

### **Token Utility**

1. **Mint New NFTs:** Players can use BT tokens to mint new character NFTs.
2. **Initiate Battles:** BT tokens are staked during battles to incentivize competition.

### **How to Play**

1. **Approve BT Tokens:** Players approve the required BT tokens for gameplay.
2. **Join or Create a Game:** Interact with the matchmaking smart contract.
3. **Battle Execution:**
   - The matchmaking contract locks BT tokens and NFTs during the game.
   - The winner receives the staked BT tokens.
   - Both players reclaim their NFTs at the end of the battle.

---

## **Security**

To ensure a fair and secure environment:

1. **Rank System:**

   - Players with higher rankings cannot exploit the system by competing against low-ranking players.
   - Ensures competitive and balanced matchmaking.

2. **Encryption:**

   - NFT stats are only visible to their owners and relevant smart contracts, preventing stat manipulation or data leaks.

3. **Randomness:**
   - fhEVM’s built-in random number generation ensures unpredictable outcomes, protecting against deterministic exploits.

---

## **Roadmap**

### **Development Milestones**

1. **Smart Contract Completion**

   - Finalize core smart contracts for NFT handling, battles, and matchmaking.

2. **Gas-Efficient Optimizations**

   - Improve winner calculation and matchmaking algorithms to reduce transaction costs.

3. **Backend Implementation**

   - Develop backend infrastructure to support advanced features and data storage.

4. **Launch Governance System**
   - Introduce DAO functionality for decentralized game management.

---

## **Features**

- **Decentralized Gameplay:**
  - No centralized server; the game logic is entirely on-chain.
- **DAO-Managed Ecosystem:**
  - DAO participants can balance gameplay, approve new NFTs, and govern the ecosystem.
- **Hacker-Resistant Architecture:**
  - Leveraging fhEVM encryption to protect sensitive game data.
- **Dynamic Ranking System:**
  - Ensures fair matchups based on skill and experience.

---

## **How to Contribute**

We welcome contributions from the community! Here's how you can get involved:

1. **Fork the Repository:**
   - Clone and start contributing by building features or fixing bugs.
2. **Open Issues:**
   - Report bugs or suggest enhancements in the Issues section.
3. **Submit Pull Requests:**
   - Once your changes are ready, submit a pull request for review.

### **Developer Setup**

- Install dependencies:
  ```bash
  npm install
  ```

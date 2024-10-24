# Knowledge-Based System for Travel Advisory

![image](https://github.com/user-attachments/assets/bb1679a6-4fd8-4792-a205-05fd676a0ea3)


## Project Overview
This project aims to develop a **Knowledge-Based System (KBS)** to provide travel recommendations based on user preferences. The system incorporates **uncertainty** and **explainability** to better assist users. The implementation focuses on two user scenarios: those who have clear ideas about their travel destinations and those who are uncertain.

### Key Components
1. **Section A - Without Uncertainty**: Handles users who have specific preferences, asking targeted questions and providing precise travel recommendations.
2. **Section B - With Uncertainty**: Handles users who are unsure of their destination. It uses broader questions and incorporates certainty factors to generate recommendations.

### How the System Works
- The system uses two main modules for each section:
  - **Module A** (Without Uncertainty):
    - Asks specific questions based on predefined choices to provide a detailed recommendation.
    - Contains sub-modules for user inquiry, travel calculation, and recommendations.
  - **Module B** (With Uncertainty):
    - Asks broader and simpler questions to gather general preferences.
    - Utilizes certainty factors to infer the most appropriate travel recommendation.

### How to Execute the Code
1. **Prepare the Environment**:
   - Make sure you have the **CLIPS** environment installed as the knowledge-based system runs on this framework.

2. **Load the CLIPS File**:
   - Load the `.clp` file into the CLIPS environment using the command:
     ```clips
     (load "path_to_your_file.clp")
     ```

3. **Initialize and Run the System**:
   - Reset the system:
     ```clips
     (reset)
     ```
   - Start the system:
     ```clips
     (run)
     ```

4. **Interacting with the System**:
   - You will be prompted to answer whether you have a clear idea of your destination:
     - Respond **"yes"** to enter Section A (without uncertainty) or **"no"** to enter Section B (with uncertainty).
   - Follow the on-screen instructions to answer the questions.
   - For Section A, if unsatisfied with the recommended destination, you can repeat or refine the inquiry.
   - The system is case-insensitive and allows you to exit at any point by typing **"stop"**.

### System Validation and Testing
- The system undergoes a thorough **verification and validation process** to ensure it is complete, correct, and consistent. The system includes various **test cases** to check for valid recommendations based on different user responses.



If you wish to contribute to this project, feel free to fork the repository and submit a pull request with your improvements.

This project is licensed under the MIT License. See the LICENSE file for more details.

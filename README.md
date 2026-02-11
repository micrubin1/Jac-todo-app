# Micah's Todo App

Name: Micah Rubin. 
UMID: 9188 2977

## Features Added

### Priority Levels
Each task can be assigned a priority of low, medium, or high. Clicking the priority badge on a task cycles through the three levels. Priorities are color-coded: green for low, yellow for medium, and red for high.

### Due Dates
Tasks support optional due dates via a date picker. Overdue tasks are visually highlighted in red so they stand out in the list.

### Eisenhower Matrix
A full-width 2x2 grid displayed below the task list that automatically sorts active (non-completed) tasks into four quadrants:
- **Q1 — Do First** (red): High priority and due within 3 days or overdue
- **Q2 — Schedule** (green): High priority with no pressing deadline
- **Q3 — Delegate** (yellow): Lower priority but time-sensitive
- **Q4 — Eliminate** (gray): Lower priority with no urgent deadline

The matrix updates in real time as tasks are added, completed, or modified.

## Installation and Running

1. Install Jac by following the instructions at [jaseci.org](https://www.jaseci.org/)
2. Clone the repository:
   ```bash
   git clone https://github.com/micrubin1/Jac-todo-app.git
   cd Jac-todo-app
   ```
3. Export your API key for the LLM (used by the AI meal planner), for example if using Gemini:
   ```bash
   export GEMINI_API_KEY='your_api_key'
   ```
4. Run the application:
   ```bash
   jac run main.jac
   ```
5. Open the app in your browser at the URL shown in the terminal.

## Code Location

| Feature | Files |
|---|---|
| Priority levels | `main.jac` (Todo node `priority` field, `UpdatePriority` walker), `components/TodoItem.cl.jac` (badge rendering and click cycling), `styles.css` (`.priority-badge` and `.priority-low/medium/high` classes) |
| Due dates | `main.jac` (Todo node `due_date` field, `UpdateDueDate` walker), `components/TodoItem.cl.jac` (date picker and overdue styling), `styles.css` (`.todo-due-date` and `.todo-due-date-overdue` classes) |
| Eisenhower Matrix | `components/EisenhowerMatrix.cl.jac` (quadrant sorting logic and rendering), `frontend.cl.jac` (import and placement in the layout), `styles.css` (`.matrix-section`, `.matrix-grid`, and `.matrix-quadrant` classes) |

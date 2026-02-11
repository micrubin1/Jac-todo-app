# Micah's Todo App

Name: Micah Rubin<br>
UMID: 9188 2977

## Features Added

### Priority Levels
Each task can be assigned a priority of low, medium, or high. Clicking the priority badge on a task cycles through the three levels. Priorities are color-coded: green for low, yellow for medium, and red for high.

### Due Dates
Tasks support optional due dates via a date picker. Overdue tasks are visually highlighted in red so they stand out in the list.

### Eisenhower Matrix
A full-width 2x2 grid displayed below the task list that automatically sorts active (non-completed) tasks into four quadrants:
- **Q1 — Do First** (red): High priority and time-sensitive
- **Q2 — Schedule** (green): High priority with no pressing deadline
- **Q3 — Delegate** (yellow): Lower priority but time-sensitive
- **Q4 — Eliminate** (gray): Lower priority with no urgent deadline

The matrix updates in real time as tasks are added, completed, or modified.

### How the Eisenhower Matrix Works
The matrix uses two existing todo fields to classify each task along two axes:
- **Importance (Y-axis):** Determined by the task's priority level. Tasks with a priority of "high" are classified as Important; all others (medium, low) are Not Important.
- **Urgency (X-axis):** Determined by the task's due date. If a task has a due date that is within 3 days from now or already overdue, it is classified as Urgent. Tasks with no due date or a due date further than 3 days out are Not Urgent.

The component (`components/EisenhowerMatrix.cl.jac`) filters out completed tasks, then loops through the remaining ones and pushes each into one of four lists based on the importance/urgency combination. These lists are rendered as a 2x2 CSS grid, where each quadrant is a card with a colored left border indicating its category. The matrix is placed in `frontend.cl.jac` as a full-width section below the two-column layout so it spans the entire width of the app.

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

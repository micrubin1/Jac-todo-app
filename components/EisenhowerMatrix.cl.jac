"""Eisenhower Matrix component — organizes todos into 4 priority quadrants."""

def:pub EisenhowerMatrix(todos: list) -> any {
    THREE_DAYS_MS = 3 * 86400000;

    activeTodos = todos.filter(
        lambda t: any -> bool { return not t.completed; }
    );

    q1 = [];  # Important & Urgent — Do First
    q2 = [];  # Important & Not Urgent — Schedule
    q3 = [];  # Not Important & Urgent — Delegate
    q4 = [];  # Not Important & Not Urgent — Eliminate

    for todo in activeTodos {
        isImportant = todo.priority == "high";
        isUrgent = todo.due_date and (Date.parse(todo.due_date) - Date.now()) <= THREE_DAYS_MS;

        if isImportant and isUrgent {
            q1.push(todo);
        } elif isImportant and not isUrgent {
            q2.push(todo);
        } elif not isImportant and isUrgent {
            q3.push(todo);
        } else {
            q4.push(todo);
        }
    }

    return
        <div className="matrix-section">
            <h2 className="matrix-title">Eisenhower Matrix</h2>
            <div className="matrix-grid">
                <div className="matrix-quadrant matrix-q1">
                    <div className="matrix-quadrant-title">Q1: Do First</div>
                    {(
                        <div className="matrix-empty">No items</div>
                    ) if q1.length == 0 else (
                        <div>
                            {[
                                <div className="matrix-todo" key={todo.id}>{todo.title}</div>
                                for todo in q1
                            ]}
                        </div>
                    )}
                </div>
                <div className="matrix-quadrant matrix-q2">
                    <div className="matrix-quadrant-title">Q2: Schedule</div>
                    {(
                        <div className="matrix-empty">No items</div>
                    ) if q2.length == 0 else (
                        <div>
                            {[
                                <div className="matrix-todo" key={todo.id}>{todo.title}</div>
                                for todo in q2
                            ]}
                        </div>
                    )}
                </div>
                <div className="matrix-quadrant matrix-q3">
                    <div className="matrix-quadrant-title">Q3: Delegate</div>
                    {(
                        <div className="matrix-empty">No items</div>
                    ) if q3.length == 0 else (
                        <div>
                            {[
                                <div className="matrix-todo" key={todo.id}>{todo.title}</div>
                                for todo in q3
                            ]}
                        </div>
                    )}
                </div>
                <div className="matrix-quadrant matrix-q4">
                    <div className="matrix-quadrant-title">Q4: Eliminate</div>
                    {(
                        <div className="matrix-empty">No items</div>
                    ) if q4.length == 0 else (
                        <div>
                            {[
                                <div className="matrix-todo" key={todo.id}>{todo.title}</div>
                                for todo in q4
                            ]}
                        </div>
                    )}
                </div>
            </div>
        </div>;
}

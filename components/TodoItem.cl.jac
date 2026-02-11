"""Todo item component."""

def:pub TodoItem(todo: dict, onToggle: any, onDelete: any, onSetUrgency: any, onSetDueDate: any) -> any {
    nextUrgency = (
        "medium" if todo.urgency == "low" else (
            "high" if todo.urgency == "medium" else "low"
        )
    );
    urgencyClass = "urgency-badge urgency-" + (todo.urgency if todo.urgency else "low");
    isOverdue = todo.due_date and Date.parse(todo.due_date) < Date.now();
    dueDateClass = "todo-due-date todo-due-date-overdue" if isOverdue else "todo-due-date";
    return
        <div className="todo-item">
            <input
                type="checkbox"
                checked={todo.completed}
                onChange={lambda -> None { onToggle(todo.id); }}
                className="todo-checkbox"
            />
            <span className={("todo-title-completed" if todo.completed else "todo-title")}>
                {todo.title}
            </span>
            {(
                <span className="category-badge">{todo.category}</span>
            ) if todo.category and todo.category != "other" else None}
            <span
                className={urgencyClass}
                onClick={lambda -> None { onSetUrgency(todo.id, nextUrgency); }}
            >
                {(todo.urgency if todo.urgency else "low")}
            </span>
            <input
                type="date"
                value={todo.due_date if todo.due_date else ""}
                onChange={lambda e: any -> None { onSetDueDate(todo.id, e.target.value); }}
                className={dueDateClass}
            />
            <button
                onClick={lambda -> None { onDelete(todo.id); }}
                className="todo-delete-btn"
            >
                ×
            </button>
        </div>;
}

"""Todo item component."""

def:pub TodoItem(todo: dict, onToggle: any, onDelete: any, onSetPriority: any, onSetDueDate: any) -> any {
    nextPriority = (
        "medium" if todo.priority == "low" else (
            "high" if todo.priority == "medium" else "low"
        )
    );
    priorityClass = "priority-badge priority-" + (todo.priority if todo.priority else "low");
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
                className={priorityClass}
                onClick={lambda -> None { onSetPriority(todo.id, nextPriority); }}
            >
                {(todo.priority if todo.priority else "low")}
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

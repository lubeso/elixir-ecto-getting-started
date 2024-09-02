postgres = {
    "kubernetes": {
        "resources": [
            "storageclass",
            "persistentvolume",
            "persistentvolumeclaim",
	    "secret",
            "deployment",
            "service",
        ]
    }
}

for resource in postgres["kubernetes"]["resources"]:
    k8s_yaml(
        yaml="kubernetes/postgres/{}.yaml".format(resource)
    )

k8s_resource(
    labels=["postgres"],
    workload="postgres",
    objects=[
        "postgres:{}".format(resource)
        for resource in postgres["kubernetes"]["resources"]
	if resource not in ("deployment", "service")
    ],
    port_forwards=[port_forward(5432, 5432, "postgresql://")]
    if resource == "service"
    else None,
)

ecto = {
    "cmds": [
        "create",
        "migrate",
        "drop",
    ]
}

for cmd in ecto["cmds"]:
    local_resource(
        labels=["ecto"],
        name="ecto-{}".format(cmd),
        cmd="mix ecto.{}".format(cmd),
        auto_init=True,
        trigger_mode=TRIGGER_MODE_MANUAL,
    )
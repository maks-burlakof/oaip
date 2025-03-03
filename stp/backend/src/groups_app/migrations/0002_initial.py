# Generated by Django 5.1.1 on 2024-10-12 10:56

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ("groups_app", "0001_initial"),
        ("users_app", "0001_initial"),
    ]

    operations = [
        migrations.AddField(
            model_name="group",
            name="followers",
            field=models.ManyToManyField(
                blank=True,
                related_name="followed_groups",
                to="users_app.user",
                verbose_name="Followers",
            ),
        ),
        migrations.AddField(
            model_name="group",
            name="owner",
            field=models.OneToOneField(
                on_delete=django.db.models.deletion.DO_NOTHING,
                related_name="owned_group",
                to="users_app.user",
                verbose_name="Owner user",
            ),
        ),
    ]

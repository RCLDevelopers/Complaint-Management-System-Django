# Generated by Django 5.0.4 on 2024-04-26 15:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cmsapp', '0010_alter_complaints_complainttype'),
    ]

    operations = [
        migrations.AddField(
            model_name='complaints',
            name='remark',
            field=models.TextField(blank=True),
        ),
        migrations.AddField(
            model_name='complaints',
            name='status',
            field=models.CharField(default=0, max_length=250),
        ),
        migrations.AlterField(
            model_name='customuser',
            name='user_type',
            field=models.CharField(choices=[(2, 'compuser'), (1, 'admin')], default=1, max_length=50),
        ),
    ]